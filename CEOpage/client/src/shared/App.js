import React, { Component } from 'react';
import { Route ,Switch} from 'react-router-dom';

//Router
import { Management, Registoration, Analysis, QnA, Login, Register, CeoMain } from '../pages';

// components
import {Footers, HeaderMenu} from '../components';

class App extends Component {

      render(){
        return (
            <div>
                <Switch>
                <Route exact path="/ceoMain" component={CeoMain}/>
                <HeaderMenu/>
                </Switch>
                <Route exact path="/" component={Registoration}/>
                <Route path="/Management" component={Management}/>
                <Route path="/Analaysis" component={Analysis}/>
                <Route path="/QnA" component={QnA}/>
                <Route path="/Register" component={Register}/>
                <Route path="/Login" component={Login}/>

                <Footers/>
            </div>
        );
    }
}

export default App;