import React,{Component} from 'react';
import axios from 'axios';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogTitle from '@material-ui/core/DialogTitle';
import Button from '@material-ui/core/Button';
import { withRouter } from "react-router-dom";

class ShowUpdate extends Component {

    constructor(props) {
        super(props);
        this.state = {
            troup_id: '',
            genre_id:'',
            show_id:'',
            show_title: '',
            start_date: '',
            end_date: '',
            show_preview: '',
            show_content: '',
            show_thumbnail: '',
            genre_name: '',
            genre_content: '',
            show_time: '',
            show_length: '',
            audience1_price: '',
            audience2_price: '',
            audience3_price: '',
            audience4_price: '',
            audience5_price: '',
            audience6_price: '',
            file: null,
            fileName: '',
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
            troup_id: '',
            genre_id: '',
            show_id: '',
            show_title: '',
            start_date: '',
            end_date: '',
            show_preview: '',
            show_content: '',
            show_thumbnail: '',
            genre_name: '',
            genre_content: '',
            show_time: '',
            show_length: '',
            audience1_price: '',
            audience2_price: '',
            audience3_price: '',
            audience4_price: '',
            audience5_price: '',
            audience6_price: '',
            file: null,
            fileName: '',
            open: false

        })
    }

    handleFileChange = (e) => {
        this.setState({
            file: e.target.files[0],
            fileName: e.target.value
        })

    }


    
    handleValueChange = (e) => {
        let nextState = {};
        nextState[e.target.name] = e.target.value;
        this.setState(nextState);
    }

    axios = () => {
        var params = new URLSearchParams();


        params.append('troup_id',this.state.troup_id)
        params.append('genre_id',this.state.genre_id)
        params.append('show_title',this.state.show_title)
        params.append('start_date',this.state.start_date)
        params.append('end_date',this.state.end_date)
        params.append('show_preview',this.state.show_preview)
        params.append('show_content',this.state.show_content)
        params.append('thumbnail',this.state.file)
        const config = {
            headers: {
                'content-type': 'multipart/params'
            }
        }
   
        axios.post('/api/showManagementUpdateShow',params,config)
        .then((Response) => {
            console.log(Response);
        }).catch((ex) =>{
            console.log(ex);
        })



        var paramsG = new URLSearchParams();
    
        paramsG.append('genre_name',this.state.genre_name)
        paramsG.append('genre_content',this.state.genre_content)
   
        axios.post('/api/showManagementUpdateGenre',paramsG)
        .then((Response) => {
            console.log(Response);
        }).catch((ex) =>{
            console.log(ex);
        })



        var paramsSD = new URLSearchParams();
    
        paramsSD.append('show_id',this.state.show_id)
        paramsSD.append('show_time',this.state.show_time)
        paramsSD.append('show_length',this.state.show_length)
   
        axios.post('/api/showManagementUpdateShowDate',paramsSD)
        .then((Response) => {
            console.log(Response);
        }).catch((ex) =>{
            console.log(ex);
        })




        var paramsAP = new URLSearchParams();
        
        
        paramsAP.append('show_id',this.state.show_id)
        paramsAP.append('audience1_price',this.state.audience1_price)
        paramsAP.append('audience2_price',this.state.audience2_price)
        paramsAP.append('audience3_price',this.state.audience3_price)
        paramsAP.append('audience4_price',this.state.audience4_price)
        paramsAP.append('audience5_price',this.state.audience5_price)
        paramsAP.append('audience6_price',this.state.audience6_price)
   
        axios.post('/api/showManagementUpdateAudiencePrice',paramsAP)
        .then((Response) => {
            console.log(Response);
        }).catch((ex) =>{
            console.log(ex);
        })
        
    }


     
    handleDropdownChange(e) {
        this.setState({genre_name : e.target.value });
      }


    page=()=>{
       this.props.history.push('/showManagement')
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
                <h1>상영작 수정</h1>
                극단번호:<input type="text" name="troup_id" value={this.state.troup_id} onChange={this.handleValueChange}/><br/>
                공연번호:<input type="text" name="show_id" value={this.state.show_id} onChange={this.handleValueChange}/><br/>
                장르번호:<input type="text" name="genre_id" value={this.state.genre_id} onChange={this.handleValueChange}/><br/>
                공연제목: <input type="text" name="show_title" value={this.state.show_title} onChange={this.handleValueChange}/><br/>
                공연일자: <input type="date" name="start_date" value={this.state.start_date} onChange={this.handleValueChange}/> <input type="date" name="end_date" value={this.state.end_date} onChange={this.handleValueChange}/><br/>
                공연시간: <input type="text" name="show_time" value={this.state.show_time} onChange={this.handleValueChange}/><br/>
                런닝타임: <input type="text" name="show_length" value={this.state.show_length} onChange={this.handleValueChange}/><br/>
                장르/설명: <select id = "dropdown" onChange={this.handleDropdownChange}>
                        <option value="N/A">장르명</option>
                        <option value="로맨스">로맨스</option>
                        <option value="스릴러">스릴러</option>
                        <option value="코믹">코믹</option>
                        <option value="드라마">드라마</option>
                        </select> <input type="text" name="genre_content" value={this.state.genre_content} onChange={this.handleValueChange}/><br/>
                공연설명: <input type="text" name="show_content" value={this.state.show_content} onChange={this.handleValueChange}/><br/>
                공연사진첨부: <input type="file" file={this.state.file} value={this.state.fileName} onChange={this.handleFileChange}/><br/>
                공연영상첨부: <input type="text" name="show_preview" value={this.state.show_preview} onChange={this.handleValueChange}/><br/>
                <h2>가격 입력</h2>
                일반: <input type="text" name="audience1_price" value={this.state.audience1_price} onChange={this.handleValueChange}/><br/>
                어린이: <input type="text" name="audience2_price" value={this.state.audience2_price} onChange={this.handleValueChange}/><br/>
                노인: <input type="text" name="audience3_price" value={this.state.audience3_price} onChange={this.handleValueChange}/><br/>
                장애인: <input type="text" name="audience4_price" value={this.state.audience4_price} onChange={this.handleValueChange}/><br/>
                유공자: <input type="text" name="audience5_price" value={this.state.audience5_price} onChange={this.handleValueChange}/><br/>
                기타: <input type="text" name="audience6_price" value={this.state.audience6_price} onChange={this.handleValueChange}/><br/>
                








                <Button variant="contained" color="primary" onClick={this.handleClickOpen}>수정</Button>
                <Dialog open={this.state.open} onClose={this.handleClose}>
                    <DialogTitle onClose={this.handleClose}>상영작을 수정하시겠습니까? 수정 후 확인창을 눌러주세요.</DialogTitle>
                    <DialogActions>
                        <Button variant="contained" color="primary" onClick={this.handleFormSubmit}>등록</Button>
                        <Button variant="contained" color="primary" onClick={this.handleClose}>취소</Button>
                    </DialogActions>
                </Dialog>
                <Button variant="contained" color="primary" onClick={this.page}>수정</Button>
                <Button variant="contained" color="primary" onClick={this.page}>취소</Button>

            </form>

                
            </div>
        )
    
    }
    
   
}

export default withRouter(ShowUpdate);