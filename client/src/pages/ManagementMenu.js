import React from 'react';
import HeaderMenu from '../components/HeaderMenu';
import { NavLink, Route } from 'react-router-dom';
import TicketManagement from './TicketManagement';
import ReviewManagement from './ReviewManagement';
import TroupManagement from './TroupManagement';
import TroupManagementUpdate from './TroupManagementUpdate';
import ShowManagementUpdate from './ShowManagementUpdate';
// import ShowCheck from './ShowCheck';
// import TheaterManagement from './TheaterManagement';


const ManagementMenu = ({match}) => {
    return (
        <div>
            <HeaderMenu/>
           <ul>
                <li><NavLink to={`${match.path}/ticketManagement`}>예매관리</NavLink></li>
                <li><NavLink to={`${match.path}/reviewManagement`}>리뷰관리</NavLink></li>
                <li><NavLink to={`${match.path}/troupManagement`}>극단관리</NavLink></li>
                <li><NavLink to={`${match.path}/troupManagementUpdate`}>극단수정</NavLink></li>
                <li><NavLink to={`${match.path}/showManagementUpdate`}>상영작수정</NavLink></li>
                {/* <li><NavLink to={`${match.path}/showCheck`}>검표</NavLink></li> */}
                {/* <li><NavLink to={`${match.path}/theaterManagement`}>극장관리</NavLink></li> */}
           </ul>
           <Route exact path={match.path} render={()=>(<br/>)}/>
           <Route path={`${match.path}/ticketManagement`} component={TicketManagement}/>
           <Route path={`${match.path}/reviewManagement`} component={ReviewManagement}/>
           <Route path={`${match.path}/troupManagement`} component={TroupManagement}/>
           <Route path={`${match.path}/troupManagementUpdate`} component={TroupManagementUpdate}/>
           <Route path={`${match.path}/showManagementUpdate`} component={ShowManagementUpdate}/>
           {/* <Route path={`${match.path}/showCheck`} component={ShowCheck}/> */}
           {/* <Route path={`${match.path}/theaterManagement`} component={TheaterManagement}/> */}
           
        </div>
    );
};

export default ManagementMenu;