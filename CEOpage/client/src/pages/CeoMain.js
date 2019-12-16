import React from 'react';
import "./CeoMain.css";

const CeoMain = () => {
    return (
        <div>
        <div id="nav" className="owner-header">
            <div className="clearfix">
                <h2><a href ="/CeoMain" className="logo">3조 사이트</a></h2>
                <ul className="ext">
                    {/* 로그인 회원가입 화면 구현시 링크 주소 기입 */}
                    <li className="outlink"><a href="/CeoMain">로그인</a></li>
                    <li className="outlink"><a href="/CeoMain">회원가입</a></li>
                </ul>
            </div>
        </div>
        <div className="own-container">
            <div className="own-main">
                {/* ceo 화면 모두 구현시 링크 주소 기입 */}
               <ul className="nav clearfix">
                <li className="n1"><a href="/">샘플테스트용</a></li>   
                <li className="n2"><a href="/CeoMain">극단등록</a></li>   
                <li className="n3"><a href="/CeoMain">극단관리</a></li>   
                <li className="n4"><a href="/CeoMain">분석</a></li>   
                <li className="n5"><a href="/CeoMain">Q&A</a></li>   
               </ul> 
            <div className="mid clearfix">
                <div id="banner">
                {/* 영상을 넣을 생각이었는데, 실제 요기요 사이트는 ol태그를 이용해서 링크로 이동하게 되어있다. */}
                </div>
                <div className="owner-login">
                    <div className="status-logout">
                        <form>
                            <div><input type="text" className="" name="" id="" placeholder="아이디 입력"></input></div>
                            <div><input type="text" className="" name="" id="" placeholder="비밀번호 입력"></input></div>
                            <div className="id_pw_opt">
                                {/* <label><input type="checkbox" name="save_id" id="save_id">아이디 저장</input></label> */}
                                <a href="/CeoMain">아이디/비밀번호 찾기</a>
                            </div>
                            <div>
                                <button type="submit" className="btn-own-login">로그인</button>
                                {/* <div>배너 넣을건데 혹시 틀이 깨질까봐 일단 둠</div> */}
                            </div>
                        </form>
                    </div>
                </div>

            </div>
            </div>
        </div>
            <div className="footer"></div>
           
        </div>
    );
};

export default CeoMain;