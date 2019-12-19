import { AUTH_LOGIN, AUTH_LOGIN_SUCCESS, AUTH_LOGIN_FAILURE, AUTH_REGISTER, AUTH_REGISTER_SUCCESS, AUTH_REGISTER_FAILURE } from './ActionType';

import axios from 'axios';

// Login
export function loginRequest(userid, password) {
    return (dispatch) => {
        // Inform Login API is starting
        dispatch(login());

        //API REQUEST
        return axios.post('/api/account/signin', {userid, password})
        .then((response) => {
            //SUCCEED
            dispatch(loginSuccess(userid));
        }).catch((error) => {
            //FAILED
            dispatch(loginFailure());
        });
    };
}

export function login() {
    return {
        type : AUTH_LOGIN
    };
}

export function loginSuccess(username) {
    return {
        type: AUTH_LOGIN_SUCCESS,
        username
    };
}
export function loginFailure() {
    return {
        type: AUTH_LOGIN_FAILURE
    };
}

export function registerRequest(userid, password, passwordConfirm, email, username, phonenumber, businessnumber) {
    return (dispatch) => {
        
    };
}

export function register() {
    return {
        type: AUTH_REGISTER
    };
}

export function registerSuccess() {
    return{
        type: AUTH_REGISTER_SUCCESS
    };
}

export function registerFailure(error) {
    return {
        type: AUTH_REGISTER_FAILURE,
        error
    };
}