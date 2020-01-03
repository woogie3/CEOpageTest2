import React, {Component} from 'react';
import TroupManagementTable from 'components/TroupManagementTable';
import Table from '@material-ui/core/Table';
import TableHead from '@material-ui/core/TableHead';
import TableBody from '@material-ui/core/TableBody';
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import Container from '@material-ui/core/Container';
import { CircularProgress } from '@material-ui/core';
import { withRouter } from "react-router-dom";
import Button from '@material-ui/core/Button';
//import {fade} from '@material-ui/core/styles/colorManipulator';
//import Axios from 'axios';

class TroupManagement extends Component {
    
    constructor(props) {
        super(props);
        this.state = {
            troupManagement: '',
            completed: 0,
            searchKeyword: ''
            
        }
        this.stateRefresh = this.stateRefresh.bind(this);
    }

    stateRefresh = () => {
        this.setState({
            troupManagement: '',
            completed: 0
        
       });
        this.callApi()
        .then(res => this.setState({troupManagement: res}))
        .catch(err => console.log(err));
    }
    

    componentDidMount() {
        this.timer = setInterval(this.progress, 20);
        this.callApi()
        .then(res => this.setState({troupManagement: res}))
        .catch(err => console.log(err));
        
    }

    callApi = async () => {
        const response = await fetch('/api/troupManagement');
        const body = await response.json();
    
        return body;
    }

    progress = () => {
        const { completed } = this.state;
        this.setState({ completed: completed >= 100 ? 0 : completed + 1 });
      };


      page=()=>{
        this.props.history.push('/troupManagementUpdate')
    }

    page2=()=>{
        this.props.history.push('/')
    }

    

    handleValueChange = (e) => {
        let nextState = {};
        nextState[e.target.name] = e.target.value;
        this.setState(nextState);
    }

    render() {
        const filteredComponents = (data) => {
            data = data.filter((c) => {
                return c.troup_name.indexOf(this.state.searchKeyword) > -1;
            });
            return data.map((c) => {
                return <TroupManagementTable stateRefresh={this.stateRefresh} user_id={c.user_id} troup_name={c.troup_name} troup_phone={c.troup_phone} bank_name={c.bank_name}  bank_account={c.bank_account} kakao_account={c.kakao_account} seat_yn={c.seat_yn}  troup_id={c.troup_id} theater_name={c.theater_name} theater_location={c.theater_location} latitude={c.latitude} longtitude={c.longtitude} entire_row={c.entire_row} entire_column={c.entire_column}/>


            })
        }
        //const { classes } = this.props;
        const cellList = [ "ID", "극단이름", "전화번호", "은행명", "계좌번호", "카톡아이디", "좌석제여부", "극장아이디", "극장이름", "극장위치", "위도", "경도", "전체행", "전체열"]
        
        return(
            <div>

             <Container class= "Troup_management_table">
                <Table>
                    <TableHead>
                        <TableRow>
                            {cellList.map(c => {
                                return <TableCell>{c}</TableCell>
                            })}
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {this.state.troupManagement ?
                        filteredComponents(this.state.troupManagement) :
                        <TableRow>
                            <TableCell colSpan="6" align="center">
                                <CircularProgress  variant="determinate" value={this.state.completed} />
                            </TableCell>
                            </TableRow>
                            }
                    </TableBody>
                </Table>
                <Button variant="contained" color="primary" onClick={this.page}>수정</Button>
                <Button variant="contained" color="primary" onClick={this.page2}>돌아가기</Button>
                </Container>





                
                
                
                </div>

                    
                
        );


    };
}
             export default withRouter(TroupManagement);