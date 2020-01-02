import React, { Component } from 'react';

import { BrowserRouter as Router,Route ,Switch} from 'react-router-dom';
import { Management, Registoration, Analysis, QnA, ReviewManagement, TroupManagement, TroupManagementAdd, TroupManagementUpdate, ShowManagement, ShowManagementDetail, ShowManagementAdd, ShowManagementUpdate, TheaterManagementAdd } from 'pages';
import Footers from 'components/Footers';
import CeoMain from 'pages/CeoMain';
import HeaderMenu from 'components/HeaderMenu';

class App extends Component {

      render(){
        return (
            <div>
                <Router>
                <Switch>
                <Route exact path="/ceoMain" component={CeoMain}/>
                <HeaderMenu/>
                </Switch>
                <Route exact path="/" component={Registoration}/>
                <Route path="/Management" component={Management}/>
                <Route path="/Analaysis" component={Analysis}/>
                <Route path="/QnA" component={QnA}/>
                <Route path="/reviewManagement" component={ReviewManagement}/>
                <Route path="/troupManagement" component={TroupManagement}/>
                <Route path="/troupManagementAdd" component={TroupManagementAdd}/>
                <Route path="/troupManagementUpdate" component={TroupManagementUpdate}/>
                <Route path="/showManagement" component={ShowManagement}/>
                <Route path="/showManagementAdd" component={ShowManagementAdd}/>
                <Route path="/showManagementUpdate" component={ShowManagementUpdate}/>

                <Footers/>
                </Router>
            </div>
        );
    }
}

export default App;