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
                <li><NavLink to="/Analysis" activeStyle={activeStyle}>분석</NavLink></li>
                <li><NavLink to="/QnA" activeStyle={activeStyle}>문의게시판</NavLink></li>
            </ul>
            <hr/>
        </div>
    );
};

export default Menu;