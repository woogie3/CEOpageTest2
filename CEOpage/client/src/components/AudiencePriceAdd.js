import React,{Component} from 'react';
import {post} from 'axios';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogTitle from '@material-ui/core/DialogTitle';
import Button from '@material-ui/core/Button';
import axios from 'axios';
import { withRouter } from "react-router-dom";

class AudiencePriceAdd extends Component {

    constructor(props) {
        super(props);
        this.state = {
            audience1_price: '',
            audience2_price: '',
            audience3_price: '',
            audience4_price: '',
            audience5_price: '',
            audience6_price: ''
            
            

        }
        this.handleClickOpen=this.handleClickOpen.bind(this);
        this.handleClose=this.handleClose.bind(this);
    }
    
    handleFormSubmit = (e) => {
        e.preventDefault()
        //this.addTroup()
        //.then((response) => {
            //this.props.stateRefresh();
        //})
        this.axios();
        this.setState({
            audience1_price: '',
            audience2_price: '',
            audience3_price: '',
            audience4_price: '',
            audience5_price: '',
            audience6_price: ''

        })
    }


    
    handleValueChange = (e) => {
        let nextState = {};
        nextState[e.target.name] = e.target.value;
        this.setState(nextState);
    }

    axios = () => {
        var params = new URLSearchParams();
        
        
        
        params.append('audience1_price',this.state.audience1_price)
        params.append('audience2_price',this.state.audience2_price)
        params.append('audience3_price',this.state.audience3_price)
        params.append('audience4_price',this.state.audience4_price)
        params.append('audience5_price',this.state.audience5_price)
        params.append('audience6_price',this.state.audience6_price)
   
        axios.post('/api/showManagementAdd',params)
        .then((Response) => {
            console.log(Response);
        }).catch((ex) =>{
            console.log(ex);
        })
        
    }

     page=()=>{
         this.props.history.push('/showManagement')
     }

     page2=()=>{
        this.props.history.push('/')

     }

     

    addShow =() => {
        const url = '/api/showManagementAdd';
        const formData = new FormData();
        formData.append('show_title',this.state.show_title)
        formData.append('start_date',this.state.start_date)
        formData.append('end_date',this.state.end_date)
        formData.append('show_preview',this.state.show_preview)
        formData.append('show_content',this.state.show_content)
        formData.append('show_thumbnail',this.state.show_thumbnail)
        

        console.log(this.state.troup_id);
        for (var key of formData.keys()) {
            console.log(key);
          }
          for (var value of formData.values()) {
            console.log(value);
          }
          
        const config = {
            headers:{
                'Content-Type':'application/json'
            }
        }
        return post(url,formData,config);
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
                <h2>가격 입력</h2>
                일반: <input type="text" name="audience1_price" value={this.state.audience1_price} onChange={this.handleValueChange}/><br/>
                어린이: <input type="text" name="audience2_price" value={this.state.audience2_price} onChange={this.handleValueChange}/><br/>
                노인: <input type="text" name="audience3_price" value={this.state.audience3_price} onChange={this.handleValueChange}/><br/>
                장애인: <input type="text" name="audience4_price" value={this.state.audience4_price} onChange={this.handleValueChange}/><br/>
                유공자: <input type="text" name="audience5_price" value={this.state.audience5_price} onChange={this.handleValueChange}/><br/>
                기타: <input type="text" name="audience6_price" value={this.state.audience6_price} onChange={this.handleValueChange}/><br/>
                

            </form>

            
                <Button variant="contained" color="primary" onClick={this.handleClickOpen}>등록</Button>
                <Dialog open={this.state.open} onClose={this.handleClose}>
                    <DialogTitle>상영작을 등록하시겠습니까? 등록 후 확인창을 눌러주세요.</DialogTitle>
                    <DialogActions>
                        <Button variant="contained" color="primary" onClick={this.handleFormSubmit}>등록</Button>
                        <Button variant="contained" color="primary" onClick={this.handleClose}>취소</Button>
                    </DialogActions>
                </Dialog>
                <Button variant="contained" color="primary" onClick={this.page}>확인</Button>
                <Button variant="contained" color="primary" onClick={this.page2}>취소</Button>
                
                
            </div>
        )
    
    }
    
   
}

export default withRouter(AudiencePriceAdd);