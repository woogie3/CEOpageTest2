import React,{ Component } from 'react';
import TicketListTable from 'components/TicketListTable';
import Table from '@material-ui/core/Table';
import TableHead from '@material-ui/core/TableHead';
import TableBody from '@material-ui/core/TableBody';
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import { CircularProgress, Box } from '@material-ui/core';
import SeatViewTable from 'components/SeatViewTable';
import RefundListTable from '../components/RefundListTable';
import RefundInputForm from '../components/RefundInputForm';
import InputBase from '@material-ui/core/InputBase';





class TicketManagement extends Component{
        constructor(props) {
        super(props);
        this.state = {
          ticketings:'',
          completed:0,
          searchKeyword1:'',
          searchKeyword2:''
        }
        this.stateRefresh = this.stateRefresh.bind(this);
      }
    
      stateRefresh = () => {
        this.setState({
          ticketings:'',
          refunds: '',
          completed:0,
          searchKeyword1:'',
          searchKeyword2:''
      });
        this.callApi1()
        .then(res => this.setState({ticketings: res}))
        .catch(err => console.log(err));
        this.callApi2()
        .then(res => this.setState({refunds: res}))
        .catch(err => console.log(err));
      }

    
      componentDidMount(){
        this.timer = setInterval(this.progress, 20);
        this.callApi1()
        .then(res => this.setState({ticketings: res}))
        .catch(err => console.log(err));
        this.callApi2()
        .then(res => this.setState({refunds: res}))
        .catch(err => console.log(err));
      }
    
      callApi1 = async() => {
        const response = await fetch('/api/ticketings');
        const body = await response.json();
        return body;
      }
      callApi2 = async() => {
        const response = await fetch('/api/refunds');
        const body = await response.json();
        return body;
      }
    
      progress = () => {
        const {completed} = this.state;
        this.setState({completed: completed >= 100 ? 0 : completed +1});
      };
    
      handleValueChange =(e) =>{
        let nextState = {}
        nextState[e.target.name] = e.target.value;
        this.setState(nextState);
      }
      refundCreate = (data3) => {
        console.log(data3);
      }
    
      render(){
        
        
        const filteredComponents1 = (data1) =>{
           data1 = data1.filter((c) => {
             return c.phone.indexOf(this.state.searchKeyword1) > -1;
            });
          return data1.map((c) => {
            return <TicketListTable stateRefresh={this.stateRefresh} name={c.name} user_id={c.user_id} phone={c.phone} show_title={c.show_title} show_time={c.show_time} keys={c.key} ticketing_date={c.ticketing_date}/>
          })
        }
        const cellList = ["이름", "ID", "전화번호", "상영작", "시간대", "좌석번호", "예매일자"]
        
        const filteredComponents2 = (data2) =>{
          data2 = data2.filter((d) => {
            return d.phone.indexOf(this.state.searchKeyword2) > -1;
          });
         return data2.map((d) => {
           return <RefundListTable stateRefresh={this.stateRefresh} user_id={d.user_id} phone={d.phone} name={d.name} show_title={d.show_title} show_time={d.show_time} ticketing_id={d.ticketing_id} payment_type={d.payment_type} reason_type={d.reason_type}/>
         })
       }
       const cellList1 = ["ID", "이름", "전화번호", "상영작", "시간대", "예매번호", "환불유형", "사유"]

        return (
          <div>
            <Box class="ticket_list_table">
            <label class=""></label>
            <h1>예매내역</h1>
            <label>전화번호 - </label>
            <InputBase
              placeholder="검색하기"
              
              name="searchKeyword1"
              value={this.state.searchKeyword1}
              onChange = {this.handleValueChange}
              inputProps={{ 'aria-label': 'search' }}
            />
            <Table >
            <TableHead>
              <TableRow>
                {cellList.map(c => {
                  return <TableCell>{c}</TableCell>
                })}
              </TableRow>
            </TableHead>
            <TableBody>
              {this.state.ticketings ? filteredComponents1(this.state.ticketings) :
              <TableRow>
                <TableCell colSpan="6" align ="center">
                  <CircularProgress  variant="determinate" value={this.state.completed}/>
                </TableCell>
              </TableRow>
      }
            </TableBody>
          </Table>
          </Box>
          <br/>
          <Box class="ticket_change_box">
          <a><strong>예매 변경</strong></a>
          <br/>
          <label class="change_type">변경 유형 : </label>
          <select id="change_type_box">
            <option value="change_seat">좌석 변경</option>
            <option value="change_time">시간대 변경</option>
          </select>
          <label class="time_select"> 시간대 선택 : </label>
          <select id="change_time_box">
            <option value="1">10:00~12:00</option>
            <option value="2">13:00~14:00</option>
            <option value="3">15:00~17:00</option>
            <option value="4">18:00~20:00</option>
          </select>
          <form name="input" method="post" action="">
          <label class="change_seat_number"> 변경 좌석번호 : </label>
          <input type="text" class="change_seat_number_box" name="memberName" maxlength="10"/>
          <button onClick="">변경</button>
          <input type="reset" value="취소"></input>
          </form>
          <br/>
          <SeatViewTable/>
          <br/>
          </Box>
          <br/>
          <RefundInputForm
            onCreate={this.refundCreate}/>
          <br/>
          <Box class="ticket_list_table">
          <h2>환불내역</h2>
          <label>전화번호 - </label>
          <InputBase
              placeholder="검색하기"
              
              name="searchKeyword2"
              value={this.state.searchKeyword2}
              onChange = {this.handleValueChange}
              inputProps={{ 'aria-label': 'search' }}
            />
            <Table >
            <TableHead>
              <TableRow>
                {cellList1.map(d => {
                  return <TableCell>{d}</TableCell>
                })}
              </TableRow>
            </TableHead>
            <TableBody>
              {this.state.refunds ? filteredComponents2(this.state.refunds) :
              <TableRow>
                <TableCell colSpan="7" align ="center">
                  <CircularProgress  variant="determinate" value={this.state.completed}/>
                </TableCell>
              </TableRow>
      }
            </TableBody>
          </Table>
          </Box>
          <br/>
          </div>
    );
};
}

export default TicketManagement;


