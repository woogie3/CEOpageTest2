import React,{ Component } from 'react';
import Customer from 'components/Customer';
import Table from '@material-ui/core/Table';
import TableHead from '@material-ui/core/TableHead';
import TableBody from '@material-ui/core/TableBody';
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import { CircularProgress } from '@material-ui/core';


class Management extends Component{
        constructor(props) {
        super(props);
        this.state = {
          ticketings:null,
          completed:0,
          searchKeyword:''
        }
        this.stateRefresh = this.stateRefresh.bind(this);
      }
    
      stateRefresh = () => {
        this.setState({
          ticketings:'',
          completed:0,
          searchKeyword:''
      });
        this.callApi()
        .then(res => this.setState({ticketings: res}))
        .catch(err => console.log(err));
      }
    
      componentDidMount(){
        this.timer = setInterval(this.progress, 20);
        this.callApi()
        .then(res => this.setState({ticketings: res}))
        .catch(err => console.log(err));
      }
    
      callApi = async() => {
        const response = await fetch('/api/ticketings');
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
    
      render(){
        const filteredComponents = (data) =>{
          data = data.filter((c) => {
            return c.phone.indexOf(this.state.searchKeyword) > -1;
          });
          return data.map((c) => {
            return <Customer stateRefresh={this.stateRefresh} key={c.id} id ={c.id} image={c.image} name={c.name} birthday={c.birthday} gender={c.gender} job={c.job} />
          })
        }
        const { classes } = this.props;
        const cellList = ["선택", "이름", "ID", "상영작", "시간대", "좌석번호", "예매일자"]

    
    return (
        <div>

            <Table >
            <TableHead>
              <TableRow>
                {cellList.map(c => {
                  return <TableCell>{c}</TableCell>
                })}
              </TableRow>
            </TableHead>
            <TableBody>
              {this.state.ticketings ? filteredComponents(this.state.ticketings) :
              <TableRow>
                <TableCell colSpan="6" align ="center">
                  <CircularProgress  variant="determinate" value={this.state.completed}/>
                </TableCell>
              </TableRow>
              }
            </TableBody>
          </Table>
        </div>
    );
};
}

export default Management;
