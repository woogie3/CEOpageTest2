import React from 'react';
import HeaderMenu from '../components/HeaderMenu';
import { NavLink, Route } from 'react-router-dom';
import ShowManagementAdd from './ShowManagementAdd';
import TroupManagementAdd from './TroupManagementAdd';
import ShowManagement from './ShowManagement';

const RegistorationMenu = ({match}) => {
    return (
        <div>
            <HeaderMenu/>
           <ul>
           <li><NavLink to={`${match.path}/showManagementAdd`}>상영작등록</NavLink></li>
           <li><NavLink to={`${match.path}/troupManagementAdd`}>극단등록</NavLink></li>
           <li><NavLink to={`${match.path}/showManagement`}>상영작리스트</NavLink></li>
           </ul>
           <Route exact path={match.path} render={()=>(<br/>)}/>
           <Route path={`${match.path}/showManagementAdd`} component={ShowManagementAdd}/>
           <Route path={`${match.path}/troupManagementAdd`} component={TroupManagementAdd}/>
           <Route path={`${match.path}/showManagement`} component={ShowManagement}/>
           
        </div>
    );
};

export default RegistorationMenu;