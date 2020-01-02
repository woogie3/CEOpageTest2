import React from 'react';
import { Link, Route } from 'react-router-dom';
import ShowCheck from './ShowCheck';
import TicketManagement from './TicketManagement';
import TheaterManagement from './TheaterManagement';
import ReviewManagement from './ReviewManagement';

const ManagementMenu = ({match}) => {
    return (
        <div>
           <ul>
                <li><Link to={`${match.path}/ticketManagement`}>예매관리</Link></li>
                <li><Link to={`${match.path}/showCheck`}>검표</Link></li>
                <li><Link to={`${match.path}/reviewManagement`}>리뷰관리</Link></li>
                <li><Link to={`${match.path}/theaterManagement`}>극장관리</Link></li>
           </ul>
           <Route exact path={match.path} render={()=>(<h3>원하는 메뉴를 눌러주세요</h3>)}/>
           <Route path={`${match.path}/:ticketManagement`} component={TicketManagement}/>
           <Route path={`${match.path}/:showCheck`} component={ShowCheck}/>
           <Route path={`${match.path}/:reviewManagement`} component={ReviewManagement}/>
           <Route path={`${match.path}/:theaterManagement`} component={TheaterManagement}/>
        </div>
    );
};

export default ManagementMenu;