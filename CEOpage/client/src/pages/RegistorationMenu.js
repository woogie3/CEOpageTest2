import React from 'react';
import { Link, Route } from 'react-router-dom';

const RegistorationMenu = ({match}) => {
    return (
        <div>
           <ul>
                <li><Link to={`${match.path}/1`}>상영작 등록</Link></li>
                <li><Link to={`${match.path}/2`}>극장 등록</Link></li>
           </ul>
           <Route exact path={match.path} render={()=>(<h3>원하는 메뉴를 눌러주세요</h3>)}/>
           <Route path={`${match.path}/:1`} component={}/>
           <Route path={`${match.path}/:2`} component={}/>
        </div>
    );
};

export default RegistorationMenu;