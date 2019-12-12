import React from 'react'; 
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';

class TicketListTable extends React.Component{
    render(){
        return(
            <TableRow>
                <TableCell><input type="checkbox"/></TableCell>
                <TableCell>{this.props.name}</TableCell>
                <TableCell><img src={this.props.userId} alt="profile"/></TableCell>
                <TableCell>{this.props.showTitle}</TableCell>
                <TableCell>{this.props.showTime}</TableCell>
                <TableCell>{this.props.seatNumber}</TableCell>
                <TableCell>{this.props.ticketingDate}</TableCell>
            </TableRow>
        )
    }
}
export default TicketListTable; 