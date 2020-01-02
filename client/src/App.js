import React, { Component } from 'react';
import Menu from './components/Menu';
import { ManagementMenu, Analysis, QnA, CeoMain} from './pages';
import Header from './components/Header';
import { Route ,Switch} from 'react-router-dom';
import Footers from './components/Footers';
import HeaderMenu from './components/HeaderMenu';
import Navbar from './components/Navbar';
import Landing from './components/Landing';
import Login from './components/Login';
import Register from './components/Register';
import Profile from './components/Profile';


class App extends Component {

      render(){
        return (
            <div className="App">
                <Switch>
                <Route exact path="/ceoMain" component={CeoMain}/>
                </Switch>
                <div className="container">
                    <Switch>
                        <Route exact path="/" component={Landing}/>
                        <Route exact path="/profile" component={Profile}/>
                        <Route exact path="/login" component={Login}/>
                        <Route exact path="/register" component={Register}/>
                    </Switch>
                </div>
                <Route exact path="/ManagementMenu" component={ManagementMenu}/>
                <Route exact path="/Analaysis" component={Analysis}/>
                <Route exact path="/QnA" component={QnA}/>
            </div>
        );
    }
}

export default App;