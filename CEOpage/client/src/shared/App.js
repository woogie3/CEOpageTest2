import React, { Component } from 'react';

import { Route } from 'react-router-dom';
import Menu from 'components/Menu';
import { Management, Registoration, Analysis, QnA } from '../pages';
import Header from '../components/Header';
import Footers from '../components/Footers';

class App extends Component {

      render(){
        return (
            <div>
                <Header/>
                <Menu/>
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