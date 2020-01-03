import React,{Component} from 'react';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogTitle from '@material-ui/core/DialogTitle';
import Button from '@material-ui/core/Button';
import axios from 'axios';
import { withRouter } from "react-router-dom";

class TroupAdd extends Component {

    constructor(props) {
        super(props);
        this.state = {
            user_id: '',
            troup_name: '',
            troup_phone: '',
            bank_name: '',
            bank_account: '',
            kakao_account: '',
            seat_yn: '',
            theater_name: '',
            troup_id: '',
            theater_location: '',
            latitude: '',
            longtitude: '',
            entire_row: '',
            entire_column: '',
            open: false
            

        }
        this.handleDropdownChange=this.handleDropdownChange.bind(this);
        this.handleClickOpen=this.handleClickOpen.bind(this);
        this.handleClose=this.handleClose.bind(this);
    }
    
    handleFormSubmit = (e) => {
        e.preventDefault()
        this.axios();
        this.setState({
            user_id: '',
            troup_name: '',
            troup_phone: '',
            bank_name: '',
            bank_account: '',
            kakao_account: '',
            seat_yn: '',
            theater_name: '',
            troup_id: '',
            theater_location: '',
            latitude: '',
            longtitude: '',
            entire_row: '',
            entire_column: '',
            open: false
            
            

        })
    }



    


    
    handleValueChange = (e) => {
        let nextState = {};
        nextState[e.target.name] = e.target.value;
        this.setState(nextState);
    }

    axios = () => {
        var params = new URLSearchParams();
        params.append('user_id', this.state.user_id)
        params.append('troup_name', this.state.troup_name)
        params.append('troup_phone',this.state.troup_phone)
        params.append('bank_name',this.state.bank_name)
        params.append('bank_account',this.state.bank_account)
        params.append('kakao_account',this.state.kakao_account)
        params.append('seat_yn',this.state.seat_yn)
        
   
        axios.post('/api/troupManagementAdd1',params)
        .then((Response) => {
            console.log(Response);
        }).catch((ex) =>{
            console.log(ex);
        })




        var param = new URLSearchParams();
        param.append('theater_name', this.state.theater_name)
        param.append('troup_id', this.state.troup_id)
        param.append('theater_location',this.state.theater_location)
        param.append('latitude',this.state.latitude)
        param.append('longtitude',this.state.longtitude)
        param.append('entire_row',this.state.entire_row)
        param.append('entire_column',this.state.entire_column)
   
        axios.post('/api/troupManagementAdd2',param)
        .then((Response) => {
            console.log(Response);
        }).catch((ex) =>{
            console.log(ex);
        })
        
    }

    

     
     handleDropdownChange(e) {
        this.setState({bank_name : e.target.value });
      }



      page=()=>{
        this.props.history.push('/troupManagement')
    }

    page2=()=>{
       this.props.history.push('/')

    }



    handleClickOpen() {
        this.setState({
            open: true
        });
    }


    handleClose() {
        this.setState({
            open: false
        });
    }



    render() {
        return(
            <div>
            <form onSubmit={this.handleFormSubmit}>
                <h1>극단 등록</h1>
                사장님 아이디: <input type="text" name="user_id" value={this.state.user_id} onChange={this.handleValueChange}/><br/>
                극단 이름: <input type="text" name="troup_name" value={this.state.troup_name} onChange={this.handleValueChange}/><br/>
                전화번호: <input type="text" name="troup_phone" value={this.state.troup_phone} onChange={this.handleValueChange}/><br/>
                계좌번호: <select id = "dropdown" onChange={this.handleDropdownChange}>
                        <option value="N/A">은행명</option>
                        <option value="신한은행">신한은행</option>
                        <option value="국민은행">국민은행</option>
                        <option value="우리은행">우리은행</option>
                        <option value="기업은행">기업은행</option>
                        </select> <input type="text" name="bank_account" value={this.state.bank_account} onChange={this.handleValueChange}/><br/>
                
                
                
                
                카카오ID: <input type="text" name="kakao_account" value={this.state.kakao_account} onChange={this.handleValueChange}/><br/>
                좌석제 여부: <input type="radio" name="seat_yn" value='1' onChange={this.handleValueChange}/>yes <input type="radio" name="seat_yn" value='0' onChange={this.handleValueChange}/>no<br/>


                극단 아이디: <input type="text" name="troup_id" value={this.state.troup_id} onChange={this.handleValueChange}/><br/>
                극장 이름: <input type="text" name="theater_name" value={this.state.theater_name} onChange={this.handleValueChange}/><br/>
                극장 위치: <input type="text" name="theater_location" value={this.state.theater_location} onChange={this.handleValueChange}/><br/>
                위도/경도: <input type="text" name="latitude" value={this.state.latitude} onChange={this.handleValueChange}/> <input type="text" name="longtitude" value={this.state.longtitude} onChange={this.handleValueChange}/><br/>
                행/열: <input type="text" name="entire_row" value={this.state.entire_row} onChange={this.handleValueChange}/> <input type="text" name="entire_column" value={this.state.entire_column} onChange={this.handleValueChange}/><br/>
        

                


                <Button variant="contained" color="primary" onClick={this.handleClickOpen}>등록</Button>
                <Dialog open={this.state.open} onClose={this.handleClose}>
                    <DialogTitle onClose={this.handleClose}>극단을 등록하시겠습니까? 등록 후 확인창을 눌러주세요.</DialogTitle>
                    <DialogActions>
                        <Button variant="contained" color="primary" onClick={this.handleFormSubmit}>등록</Button>
                        <Button variant="contained" color="primary" onClick={this.handleClose}>취소</Button>
                    </DialogActions>
                </Dialog>
                <Button variant="contained" color="primary" onClick={this.page}>확인</Button>
                <Button variant="contained" color="primary" onClick={this.page2}>취소</Button>
                


                

                
                </form>
            </div>
        )
    
    }
    
   
}

export default withRouter(TroupAdd);