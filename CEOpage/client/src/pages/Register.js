import React from 'react';
import { Authentication } from '../components';
import { connect } from 'react-redux';
import { registerRequest } from '../actions/authentication';
import { BrowserRouter } from "react-router-dom";

class Register extends React.Component {

    constructor(props){
        super(props);
        this.handleRegister = this.handleRegister.bind(this);
    }
    handleRegister(userid,password, passwordConfirm, email, username, phonenumber, businessnumber){
        return this.props.registerRequest(userid,password, passwordConfirm, email, username, phonenumber, businessnumber).then(
            () => {
                if(this.props.status === "SUCCESS") {
                    BrowserRouter.push('/login');
                    return true;
                } else {
                   let errorMessage = [
                       '이름이 형식에 맞지 않습니다.',
                       '비밀번호가 너무 짧습니다.',
                       '이미 사용하고 있는 계정입니다.',
                       '핸드폰 번호가 형식에 맞지 않습니다.',
                       '비밀번호가 맞지 않습니다.',
                       '이메일이 형식에 맞지 않습니다.',
                       '사업자번호가 형식에 맞지 않습니다.'
                   ];
                   return false;
                }
            }
        );
    }

    render() {
        return(
            <div>
                <Authentication mode={false} 
                    onRegister={this.handleRegister}/>
            </div>
        );
    }
}

const mapStateToProps = (state) => {
    return {
        status: state.authentication.register.status,
        errorCode: state.authentication.register.error
    };
};

const mapDispatchToProps = (dispatch) => {
    return {
        registerRequest: (userid, password, passwordConfirm, email, username, phonenumber, businessnumber) => {
            return dispatch(registerRequest(userid,password, passwordConfirm, email, username, phonenumber, businessnumber));
        }
    };
};


export default connect(mapStateToProps, mapDispatchToProps)(Register);