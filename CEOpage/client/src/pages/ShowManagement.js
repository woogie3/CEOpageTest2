import React, {Component} from 'react';
import ShowManagementTable from 'components/ShowManagementTable';
import Table from '@material-ui/core/Table';
import TableHead from '@material-ui/core/TableHead';
import TableBody from '@material-ui/core/TableBody';
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import Container from '@material-ui/core/Container';
import { CircularProgress } from '@material-ui/core';
import { withRouter } from "react-router-dom";
import Button from '@material-ui/core/Button';


class ShowManagement extends Component {
    
    constructor(props) {
        super(props);
        this.state = {
            showManagement: '',
            completed: 0,
            searchKeyword: ''
            
        }
    }

    stateRefresh = () => {
        this.setState({
            showManagement: '',
            completed: 0
        
       });
        this.callApi()
        .then(res => this.setState({showManagement: res}))
        .catch(err => console.log(err));
    }
    

    componentDidMount() {
        this.timer = setInterval(this.progress, 20);
        this.callApi()
        .then(res => this.setState({showManagement: res}))
        .catch(err => console.log(err));
        
    }

    callApi = async () => {
        const response = await fetch('/api/showManagement');
        const body = await response.json();
    
        return body;
    }

    progress = () => {
        const { completed } = this.state;
        this.setState({ completed: completed >= 100 ? 0 : completed + 1 });
      };


      page=()=>{
        this.props.history.push('/showManagementUpdate')
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
        const ShowList = (data) => {
            data = data.filter((c) => {
                return c.show_title.indexOf(this.state.searchKeyword) > -1;
            });
            return data.map((c) => {
                return <ShowManagementTable stateRefresh={this.stateRefresh} show_title={c.show_title} start_date={c.start_date} end_date={c.end_date} show_preview={c.show_preview} show_content={c.show_content}  show_thumbnail={c.show_thumbnail} genre_name={c.genre_name} genre_content={c.genre_content} show_time={c.show_time} show_length={c.show_length} audience1_price={c.audience1_price} audience2_price={c.audience2_price} audience3_price={c.audience3_price} audience4_price={c.audience4_price} audience5_price={c.audience5_price} audience6_price={c.audience6_price}/>


            })
        }
        //const { classes } = this.props;
        const cellList = ["공연썸네일", "공연미리보기", "공연제목", "시작일자", "종료일자", "공연시간", "공연길이", "장르명", "장르설명", "공연설명", "일반price", "아동price", "노인price", "장애인price","유공자price","기타price","수정","삭제"]
        
        return(
            <div>

             <Container class= "Show_management_table">
                <Table>
                    <TableHead>
                        <TableRow>
                            {cellList.map(c => {
                                return <TableCell>{c}</TableCell>
                            })}
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {this.state.showManagement ?
                        ShowList(this.state.showManagement) : 
                        <TableRow>
                            <TableCell colSpan="6" align="center">
                                <CircularProgress  variant="determinate" value={this.state.completed} />
                            </TableCell>
                            </TableRow>
                            }
                    </TableBody>
                </Table>
                <Button variant="contained" color="primary" onClick={this.page}>클릭</Button>
                <Button variant="contained" color="primary" onClick={this.page2}>돌아가기</Button>
                </Container>





                
                
                
                </div>

                    
                
        );


    };
}
             export default withRouter(ShowManagement);