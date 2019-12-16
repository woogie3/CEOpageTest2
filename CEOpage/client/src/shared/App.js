import React, { Component } from 'react';

import { Route ,Switch} from 'react-router-dom';
import { Management, Registoration, Analysis, QnA } from '../pages';
import Footers from '../components/Footers';
import CeoMain from '../pages/CeoMain';
import HeaderMenu from '../components/HeaderMenu';

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

                <Footers/>
            </div>
        );
    }
}

export default App;