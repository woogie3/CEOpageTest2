import React,{Component} from 'react';
import "../css/CeoMain.css";
import { Link,withRouter } from 'react-router-dom';
import 극단등록 from '../imges/극단등록.png';
import 극단관리 from '../imges/극단관리.png';
import 분석 from '../imges/분석.jpg';
import QnA from '../imges/QnA.jpg';
import Slideshow from '../components/Slide';
import {login} from '../components/UserFunctions';
import jwt_decode from 'jwt-decode';
import Footers from '../components/Footers';

class CeoMain extends Component {
    constructor(){
        super()
        this.state={
            user_id:'',
            password: '',
            name: '',
            completed: 0
        }
        this.onChange = this.onChange.bind(this)
        this.onSubmit = this.onSubmit.bind(this)
        this.logOut = this.logOut.bind(this)
    }

    progress = () => {
        const {completed} = this.state;
        this.setState({completed: completed >=100 ? 0: completed +1 });
    };

    componentDidMount() {
        // usertoken으로 써야 작동함
        this.timer = setInterval(this.progress, 20);
        const token = localStorage.getItem('usertoken')
        if(token !== null) {
            const decoded = jwt_decode(token)
            this.setState({
                user_id: decoded.user_id,
                name: decoded.name
            });
        }
    }

    componentWillMount() {
        // usertoken으로 써야 작동함
        this.timer = setInterval(this.progress, 20);
        const token = localStorage.getItem('usertoken')
        if(token !== null) {
            const decoded = jwt_decode(token)
            this.setState({
                user_id: decoded.user_id,
                name: decoded.name
            });
        }
    }



    onChange(e) {
        this.setState({[e.target.name]: e.target.value})
    }

    onSubmit(e) {
        e.preventDefault();
        const user ={
            user_id: this.state.user_id,
            password: this.state.password
        }

        login(user).then(res => {
            if(res) {
                console.log(res);
                this.props.history.push('/ceoMain')
            }
        })
    }
    logOut(e) {
        e.preventDefault();
        localStorage.removeItem('usertoken')
        this.props.history.push(`/ceoMain`)
    }

    render() {
        //로그인 안했을때
        const loginForm = (
            <div className="owner-login">
                <div className="status-logout">
                    <form onSubmit={this.onSubmit}>
                        <div><input type="text" className="inp-txt" name="user_id" id="user_id" placeholder="아이디 입력" value={this.state.user_id} onChange={this.onChange}></input></div>
                        <div><input type="password" className="inp-txt" name="password" id="password" placeholder="비밀번호 입력" value={this.state.password} onChange={this.onChange}></input></div>
                        <div className="id_pw_opt">                                {/* <label><input type="checkbox" name="save_id" id="save_id">아이디 저장</input></label> */}
                            <Link to={"/CeoMain"}>아이디/비밀번호 찾기</Link>
                        </div>
                        <div>
                           <button type="submit" className="btn-own-login">로그인</button>
                            {/* <div>배너 넣을건데 혹시 틀이 깨질까봐 일단 둠</div> */}
                        </div>
                    </form>
                </div>
            </div>
        )
        //로그인 했을때
        const loginSession = (
            <div className="owner-login">
                안녕하세요! {this.state.name} 님
                <a href="" onClick={this.logOut} className="btn btn-primary">로그아웃</a>
            </div>
        )
        const loginRegLink = (
            <div id="nav" className="owner-header">
                <div className="clearfix">
                <h2><Link to={"/CeoMain"} className="logo">3조 사이트</Link></h2>
                    <ul className="ext">
                        {/* 로그인 회원가입 화면 구현시 링크 주소 기입 */}
                        <li className="outlink"><Link to={"/login"}>로그인</Link></li>
                        <li className="outlink"><Link to={"/register"}>회원가입</Link></li>
                    </ul>
                </div>
            </div>
        )
        const userLink = (
            <div id="nav" className="owner-header">
                <div className="clearfix">
                    {/*Link to 안에 해당 링크 넣어주면 됩니다~!*/}
                    <h2><Link to={"/CeoMain"} className="logo">3조 사이트</Link></h2>
                    <ul className="ext">
                        {/* 로그인 회원가입 화면 구현시 링크 주소 기입 */}
                        <li className="outlink"><Link to={"/profile"}>User</Link></li>
                        <li className="outlink"><a href="" onClick={this.logOut}>로그아웃</a></li>
                    </ul>
                </div>
            </div>
        )

    return (
        <div>
            {localStorage.usertoken ? userLink : loginRegLink}

            <div className="own-container">
                <div className="own-main">
                
                    {/* ceo 화면 모두 구현시 링크 주소 기입 */}
                    <ul className="nav clearfix">
                        <li className="n1"><Link to={"/ManagementMenu"}> 극단등록<br /><img className="troup-insert" src={극단등록} alt="img" /></Link></li>
                        <li className="n2"><Link to={"/CeoMain"}>극단관리 <br /><img className="troup-management" src={극단관리} alt="극단관리" /></Link></li>
                        <li className="n3"><Link to={"/CeoMain"}>분석 <br /><img className="analysis" src={분석} alt="분석" /></Link></li>
                        <li className="n4"><Link to={"/CeoMain"}>Q&A <br /><img className="qna" src={QnA} alt="img" /></Link></li>
                    </ul>
                    <div className="mid clearfix">
                    <div className="banner">
                            <Slideshow />
                     </div>
                        {localStorage.usertoken ? loginSession : loginForm}
                    </div>
                </div>
            </div>
            
            <Footers/>
            
        </div>
    );
    }
};

export default withRouter(CeoMain);