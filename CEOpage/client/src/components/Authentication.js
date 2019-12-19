import React from 'react';
import PropTypes from 'prop-types';
import { Link } from 'react-router-dom';


class Authentication extends React.Component{

    constructor(props) {
        super(props);
        this.state = {
            username: "",
            password: "",
            passwordConfirm: "",
            userid: "",
            email: "",
            phonenumber: "",
            businessnumber: ""
        };
        this.handleChange = this.handleChange.bind(this);
        this.handleLogin = this.handleLogin.bind(this);
        this.handleRegister = this.handleRegister.bind(this);
        this.handleKeyPress = this.handleKeyPress.bind(this);
    }
    handleChange(e) {
        let nextState = {};
        nextState[e.target.name] = e.target.value;
        this.setState(nextState);
    }

    handleLogin() {
        let userid = this.state.userid;
        let password = this.state.password;

        this.props.onLogin(userid, password).then(
            // 비번 틀렸을 때
            (success) => {
                if(!success) {
                    this.setState({
                        password: ''
                    });
                }
            }
        );
    }
    handleRegister() {
        let userid = this.state.userid;
        let password = this.state.password;
        let passwordConfirm = this.state.passwordConfirm;
        let username = this.state.username;
        let email = this.state.email;
        let phonenumber = this.state.phonenumber;
        let businessnumber = this.state.businessnumber;

        this.props.onRegister(userid, password, passwordConfirm, username, email, phonenumber, businessnumber).then(
            (result) => {
                if(!result || (password !== passwordConfirm)) {
                    this.setState({
                            userid: '',
                            password: '',
                            passwordConfirm: '',
                            username: '',
                            email: '',
                            phonenumber:'',
                            businessnumber:''
                    });
                }
            }
        );
    }

    handleKeyPress(e) {
        if(e.charCode===13) {
            if(this.props.mode) {
                this.handleLogin();
            } else {
                this.handleRegister();
            }
        }
    }
    
    render(){
        const loginView = (
            <div>
                <div>
                    <div>
                        <div>
                            <label>아이디</label>
                            <input 
                            name="userid"
                            type="text"
                            className="validate"
                            onChange = {this.handleChange}
                            value = {this.state.userid} />
                        </div>
                        <div>
                            <label>비밀번호</label>
                            <input 
                            name="password"
                            type="password"
                            className="validate"
                            onChange={this.handleChange}
                            value={this.state.password} />
                        </div>
                        <button onClick={this.handleLogin}>SUBMIT</button>
                    </div>
                </div>
                <div>
                    New Here? <Link to="/register">Create an account</Link>
                </div>
            </div>
        );

        const registerView = (
            <div>
                <div>
                    <div>
                        <label>아이디</label>
                        <input 
                        name="userid"
                        type="text"
                        className="validate" 
                        onChange = {this.handleChange}
                        value = {this.state.userid} />
                    </div>
                    <div>
                        <label>비밀번호</label>
                        <input 
                        name="password" 
                        type="password"
                        className="validate"
                        onChange = {this.handleChange}
                        value = {this.state.password}
                        onKeyPress={this.handleKeyPress} />
                    </div>
                    <div>
                        <label>비밀번호 재확인</label>
                        <input 
                        name="passwordConfirm"
                        type="password"
                        className="validate"
                        onChange = {this.handleChange}
                        value = {this.state.passwordConfirm}
                        onKeyPress={this.handleKeyPress} />
                    </div>
                    <div>
                        <label>이메일</label>
                        <input 
                        name="email" 
                        type="text"
                        className="validate"
                        onChange = {this.handleChange}
                        value = {this.state.email} />
                    </div>
                    <div>
                        <label>이름</label>
                        <input 
                        name="username" 
                        type="text"
                        className="validate"
                        onChange = {this.handleChange}
                        value = {this.state.username} />
                    </div>
                    <div>
                        <label>핸드폰번호</label>
                        <input 
                        name="phonenumber" 
                        type="text"
                        className="validate"
                        onChange = {this.handleChange}
                        value = {this.state.phonenumber} />
                    </div>
                    <div>
                        <label>사업자 번호</label>
                        <input 
                        name="businessnumber" 
                        type="text"
                        className="validate"
                        onChange = {this.handleChange}
                        value = {this.state.businessnumber} />
                    </div>
                    <button onClick={this.handleRegister}>회원가입</button>
                </div>
            </div>
        );

        return(
            <div className="pages auth">
                <Link className="logo" to="/">연극어때</Link>
                <div className="card">
                    <div>
                        <div className="">{this.props.mode ? "LOGIN" : "REGISTER"}</div>
                    </div>
                </div>
                {this.props.mode ? loginView : registerView }
            </div>
        )
    }
}

Authentication.propTypes = {
    mode : PropTypes.bool,
    onLogin : PropTypes.func,
    onRegister : PropTypes.func
};
Authentication.defaultProps = {
    mode : true,
    onLogin : (userid, password) => {
        console.error("login function not defined");
    },
    onRegister : (userid, password) => {
        console.error("register function not defined");
    }
};



export default Authentication;