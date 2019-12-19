import React from 'react';
import ReactDOM from 'react-dom';
import Root from './Root';
import * as serviceWorker from './serviceWorker';
import {MuiThemeProvider, createMuiTheme} from '@material-ui/core/styles';

//Redux
import { Provider } from 'react-redux';
import { createStore, applyMiddleware } from 'redux';
import reducers from 'reducers';
import thunk from 'redux-thunk';

const theme = createMuiTheme ({
    typography: {
        fontFamily:'"Noto Sans KRm serif',
    }
});

const store = createStore(reducers, applyMiddleware(thunk));


ReactDOM.render(
    <Provider store = {store}>
        <MuiThemeProvider theme ={theme}>
            <Root/>
        </MuiThemeProvider>
    </Provider>, document.getElementById('root')
    );
serviceWorker.unregister();
