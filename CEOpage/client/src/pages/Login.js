import React from 'react';
import { Authentication } from '../components';
import { connect } from 'react-redux';
import { loginRequest } from '../actions/authentication';
import { BrowserRouter } from "react-router-dom";

class Login extends React.Component {

    constructor(props) {
        super(props);
        this.handleLogin = this.handleLogin.bind(this);
    }
    
    handleLogin(userid, password) {
        return this.props.loginRequest(userid,password).then(
            () => {
                if(this.props.status === "SUCCESS") {
                    // create session data
                    let loginData = {
                        isLoggedIn: true,
                        username: userid
                    };

                    document.cookie = 'key=' + btoa(JSON.stringify(loginData));
                    BrowserRouter.push('/');
                    return true;
                } else {
                    return false;
                }
            }
        );
    }

    render() {
        return(
            <div>
                <Authentication mode={true} 
                    onLongin={this.handleLogin} />
            </div>
        );
    }
}

const mapStateToProps = (state) => {
    return {
        status: state.authentication.login.status
    };
};

const mapDispatchToProps = (dispatch) => {
    return {
        loginRequest: (userid, password) => {
            return dispatch(loginRequest(userid,password));
        }
    };
};

export default connect(mapStateToProps, mapDispatchToProps)(Login);