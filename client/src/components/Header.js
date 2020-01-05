import React from 'react';
import { NavLink } from 'react-router-dom';

class Header extends React.Component{
    render(){
        return(
            <div> 
                    <header id="header" class="alt">
                        <ul>
					        <li><NavLink to="/" headers={headers}>연극 어때?</NavLink></li>
                        </ul>
				    </header>

            </div>
        )
    }
}
export default Header;