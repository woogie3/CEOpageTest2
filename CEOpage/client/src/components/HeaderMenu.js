import React, { Component } from 'react';

import Menu from 'components/Menu';
import Header from './Header';

class HeaderMenu extends Component {
  render(){
      return(
          <div>
          <Header/>
          <Menu/>
          </div>
      );
  }
}


export default HeaderMenu;