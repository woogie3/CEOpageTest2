import React,{Component} from 'react';
import {post} from 'axios';
import axios from 'axios';
import { withRouter } from "react-router-dom";

class GenreAdd extends Component {

    constructor(props) {
        super(props);
        this.state = {
            genre_name: '',
            genre_content: ''
            
            

        }
        this.handleDropdownChange=this.handleDropdownChange.bind(this);
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
            genre_name: '',
            genre_content: ''

        })
    }


    
    handleValueChange = (e) => {
        let nextState = {};
        nextState[e.target.name] = e.target.value;
        this.setState(nextState);
    }

    axios = () => {
        var params = new URLSearchParams();
    
        params.append('genre_name',this.state.genre_name)
        params.append('genre_content',this.state.genre_content)
   
        axios.post('/api/showManagementAdd',params)
        .then((Response) => {
            console.log(Response);
        }).catch((ex) =>{
            console.log(ex);
        })
        
    }

     

     
     handleDropdownChange(e) {
        this.setState({genre_name : e.target.value });
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
        

        console.log(this.state.show_title);
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
                <h1>상영작 등록</h1>
                장르/설명: <select id = "dropdown" onChange={this.handleDropdownChange}>
                        <option value="N/A">장르명</option>
                        <option value="로맨스">로맨스</option>
                        <option value="스릴러">스릴러</option>
                        <option value="코믹">코믹</option>
                        <option value="드라마">드라마</option>
                        </select> <input type="text" name="genre_content" value={this.state.genre_content} onChange={this.handleValueChange}/><br/>


            </form>

            
                
            </div>
        )
    
    }
    
   
}

export default withRouter(GenreAdd);