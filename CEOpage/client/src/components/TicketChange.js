import React from 'react';
import { Button, DialogTitle, DialogContent, Typography, DialogActions } from '@material-ui/core';

class TicketChange extends React.Component{
    constructor(props){
        super(props);
        this.state = { 
             open: false
        }
        // handleClickOpen을 props와 바인딩
        this.handleClickOpen = this.handleClickOpen.bind(this)
        // handleClose을 props와 바인딩
        this.handleClose = this.handleClose.bind(this);
    }
    // 버튼클릭시 사용할 메소드 :  open 정보를 변경(true로)
    handleClickOpen(){
        this.setState({
            open: true
        });
    }
    // 버튼클릭시 사용할 메소드 :  open 정보를 변경(false로)
    handleClose() {
        this.setState({
            open: false
        })
    }
    changeTicket() { 
        const url = 'api/ticketings/' + id;
        fetch(url, {
            method: 'Update'
        });
        this.props.stateRefresh();
    }
    render(){
        return(
            <div>
                 <Button variant="contained" color="secondary" onClick={this.handleClickOpen}>
                    변경
                </Button>
                <Dialog onClose={this.handleClose} open={this.state.open}>
                    <DialogTitle onClose={this.handleClose}>
                        변경 확인!
                    </DialogTitle>
                    <DialogContent>
                        <Typography gutterBottom>
                            선택한 티켓은 변경됩니다.
                        </Typography>
                    </DialogContent>
                    <DialogActions>
                        <Button variant="contained" color="primary" onClick={(e) => {this.changeTicket(this.props.id)}}>변경</Button>
                        <Button variant="outlined" color="primary" onClick={this.handleClose}>닫기</Button>
                    </DialogActions>
                </Dialog>
            </div>
        )
    }
}
export default TicketChange;