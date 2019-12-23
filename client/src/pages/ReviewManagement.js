import React, {Component} from 'react';
import ReviewManagementTable from 'components/ReviewManagementTable';
import Table from '@material-ui/core/Table';
import TableHead from '@material-ui/core/TableHead';
import TableBody from '@material-ui/core/TableBody';
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import Button from '@material-ui/core/Button';
import MenuItem from '@material-ui/core/MenuItem';
import Container from '@material-ui/core/Container';
import TextField from '@material-ui/core/TextField';
import { CircularProgress, InputBase } from '@material-ui/core';
import Select from '@material-ui/core/Select';
import InputLabel from '@material-ui/core/InputLabel';
import { spacing } from '@material-ui/system';
import {withStyles} from '@material-ui/core/styles';
import MenuIcon from '@material-ui/icons/Menu';
import SearchIcon from '@material-ui/icons/Search';
import { fade } from '@material-ui/core/styles/colorManipulator';
import Typography from '@material-ui/core/Typography';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import IconButton from '@material-ui/core/IconButton';
import Grow from '@material-ui/core/Grow';


const styles = theme => ({
    grow: {
        flexGrow: 1,
    },
    search: {
        position: 'relative',
        borderRadius: theme.shape.borderRadius,
        backgroundColor: fade(theme.palette.common.white, 0.15),
        '&:hover': {
        backgroundColor: fade(theme.palette.common.white, 0.25),
        },
        marginLeft: 0,
        width: '100%',
        [theme.breakpoints.up('sm')]: {
        marginLeft: theme.spacing.unit,
        width: 'auto',
        },
        },
        searchIcon: {
            width: theme.spacing.unit * 9,
            height: '100%',
            position: 'absolute',
            pointerEvents: 'none',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            },
            inputRoot: {
            color: 'inherit',
            width: '100%',
            },
            inputInput: {
                paddingTop: theme.spacing.unit,
                paddingRight: theme.spacing.unit,
                paddingBottom: theme.spacing.unit,
                paddingLeft: theme.spacing.unit * 10,
                transition: theme.transitions.create('width'),
                width: '100%',
                [theme.breakpoints.up('sm')]: {
                width: 120,
                '&:focus': {
                width: 200,
                },
                },
                },
});




class ReviewManagement extends Component {
    
    constructor(props) {
        super(props);
        this.state = {
            reviewManagement: '',
            completed: 0,
            searchKeyword: ''
        }
        this.stateRefresh = this.stateRefresh.bind(this);
    }

    stateRefresh = () => {
        this.setState({
            reviewManagement: '',
            completed: 0,
            searchKeyword: ''
        
        });
        this.callApi()
        .then(res => this.setState({reviewManagement: res}))
        .catch(err => console.log(err));
    }

    componentDidMount() {
        this.timer = setInterval(this.progress, 20);
        this.callApi()
        .then(res => this.setState({reviewManagement: res}))
        .catch(err => console.log(err));
        
    }

    callApi = async () => {
        const response = await fetch('/api/reviewManagement');
        const body = await response.json();
    
        return body;
    }

    progress = () => {
        const {completed} = this.state;
        this.setState({ completed: completed >= 100 ? 0 : completed +1});
    }

    handleValueChange = (e) => {
        let nextState = {};
        nextState[e.target.name] = e.target.value;
        this.setState(nextState);
    }

    render() {
        const filteredComponents = (data) => {
            data = data.filter((c) => {
                return c.user_id.indexOf(this.state.searchKeyword) > -1;
            });
            return data.map((c) => {
                return <ReviewManagementTable stateRefresh={this.stateRefresh} show_title={c.show_title} user_id = {c.user_id} review_content = {c.review_content} review_report_yn = {c.review_report_yn}/>


            })
        }
        const { classes } = this.props;
        const cellList = ["연극", "ID", "리뷰내용", "신고"]
        return(
            <div className={classes.root}>

                <div className={classes.grow} />
                <div className={classes.search}>
                <div className={classes.searchIcon}>
                <SearchIcon />
                </div>
                <InputBase
                placeholder="검색하기"
                classes={{
                root: classes.inputRoot,
                input: classes.inputInput,
                }}
                name = "searchKeyword"
                value={this.state.searchKeyword}
                onChange={this.handleValueChange}
                />
                </div>






                <Container class= "review_management_table">
                <Table>
                    <TableHead>
                        <TableRow>
                            {cellList.map(c => {
                                return <TableCell>{c}</TableCell>
                            })}
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {this.state.reviewManagement ?
                        filteredComponents(this.state.reviewManagement) :
                        <TableRow>
                            <TableCell colSpan="6" align="center">
                                <CircularProgress  variant="determinate" value={this.state.completed} />
                            </TableCell>
                            </TableRow>
                            }
                    </TableBody>
                </Table>
                </Container>
                
                
                </div>

                    
                
        );


    };
}
             export default withStyles(styles)(ReviewManagement);