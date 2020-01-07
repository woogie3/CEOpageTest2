import React from 'react'
import { post } from 'axios';

import axios from 'axios';
import { Redirect } from 'react-router-dom';

class QnAInsert extends React.Component {
    constructor(props) {
        super(props);
        console.log(props)
        this.state={
            user_id: '',
            QnA_title: '',
            QnA_content: '',
            // QNAS: '',
            completed: 0

        };
        this.handleFormsubmit = this.handleFormsubmit.bind(this)
        //this.QnAInsert = this.QnAInsert.bind(this)
        this.stateRefresh = this.stateRefresh.bind(this)
    }
    stateRefresh() {
        this.setState({
            user_id: '',
            QnA_title: '',
            QnA_content: '',
            // QNAS: '',
            completed: 0
        });
        this.callApi()
        .then(res => this.setState({QNAS: res}))
        .catch(err => console.log(err))
    }

    handleFormsubmit = (e) => {
        e.preventDefault()
       this.axios();
       this.props.history.push('/QnA');
        this.setState({
            user_id: '',
            QnA_title: '',
            QnA_content: ''

        })
    }
    handleValueChange=(e)=> {
        console.log(11)
        let nextState = {};
        nextState[e.target.name] = e.target.value;
        console.log(nextState);
        this.setState(nextState);
    }

    axios = async () =>{
        var params = new URLSearchParams();
        params.append('QnA_title', this.state.QnA_title)
        params.append('QnA_content', this.state.QnA_content)
        params.append('user_id', this.state.user_id)
        await axios.post('/api/QNA_re', params)
        .then((Response) => {
         console.log(Response);   
        }).catch((ex)=>{
         console.log(ex);
        })
        
    }
    // QnAInsert() {
    //     const url = '/api/QNAS';
    //     const formData = new FormData();
    //     formData.append('QnA_id', this.state.QnA_id)
    //     formData.append('QnA_title', this.state.QnA_title)
    //     formData.append('QnA_content', this.state.content)
    //     formData.append('user_id', this.state.user_id)
    //     formData.append('QnA_date', this.state.QnA_date)
    //     formData.append('QnA_views', this.state.views)

    //     const config = {

    //         headers: {

    //             'Content-Type': 'application/x-www-form-urlencoded',
    //             'Accept': 'application/json'

    //         }

    //     }

    //     return post(url, formData, config);


    // }



    render() {
        return (
            <form stateRefresh={this.stateRefresh} onSubmit={this.handleFormsubmit}>
                <h1>답변 작성</h1>
                제목 : <input type="text" name="QnA_title" values={this.state.QnA_title} onChange={this.handleValueChange} /> <br />
                내용 : <input type="text" name="QnA_content" values={this.state.QnA_content} onChange={this.handleValueChange} /> <br />
                작성자 : <input type="text" name="user_id" values={this.state.user_id} onChange={this.handleValueChange} /> <br />
                <button type="submit" >글쓰기</button>
            </form>
        )
    }
}

export default QnAInsert;