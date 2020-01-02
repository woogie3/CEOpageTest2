import React from 'react';
import { NavLink } from 'react-router-dom';

const Menu = () => {
    const activeStyle = {
        color: 'blue',
        fontSize: '1rem'
    };

    return (
        <div>
            
            <ul>
                <li><NavLink exact to="/" activeStyle={activeStyle}>등록</NavLink></li>
                <li><NavLink to="/Management" activeStyle={activeStyle}>관리</NavLink></li>
                <li><NavLink to="/reviewManagement" activeStyle={activeStyle}>리뷰관리</NavLink></li>
                <li><NavLink to="/troupManagementAdd" activeStyle={activeStyle}>극단등록</NavLink></li>
                <li><NavLink to="/troupManagement" activeStyle={activeStyle}>극단관리</NavLink></li>
                <li><NavLink to="/troupManagementUpdate" activeStyle={activeStyle}>극단수정</NavLink></li>
                <li><NavLink to="/showManagementAdd" activeStyle={activeStyle}>상영작등록</NavLink></li>
                <li><NavLink to="/showManagement" activeStyle={activeStyle}>상영작리스트</NavLink></li>
                <li><NavLink to="/showManagementUpdate" activeStyle={activeStyle}>상영작수정</NavLink></li>
                <li><NavLink to="/Analysis" activeStyle={activeStyle}>분석</NavLink></li>
                <li><NavLink to="/QnA" activeStyle={activeStyle}>문의게시판</NavLink></li>
            </ul>
            <hr/>
        </div>
    );
};

export default Menu;