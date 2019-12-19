import axios from "axios";
import { registerSuccess, registerFailure, register } from "./authentication";

export const AUTH_LOGIN = "AUTH_LOGIN";
export const AUTH_LOGIN_SUCCESS = "AUTH_LOGIN_SUCCESS";
export const AUTH_LOGIN_FAILURE = "AUTH_LOGIN_FAILURE";
export const AUTH_REGISTER = "AUTH_REGISTER";
export const AUTH_REGISTER_SUCCESS = "AUTH_REGISTER_SUCCESS";
export const AUTH_REGISTER_FAILURE = "AUTH_REGISTER_FAILURE";

export function registerRequest(userid, password, passwordConfirm, email, username, phonenumber, businessnumber) {
    return (dispatch) => {
        // Inform Register API is starting
        dispatch(register());

        return axios.post('api/account/api', {userid, password, passwordConfirm, email, username, phonenumber, businessnumber})
        .then((response) => {
            dispatch(registerSuccess());
        }).catch((error) => {
            dispatch(registerFailure(error.response.data.code));
        });
    };
}