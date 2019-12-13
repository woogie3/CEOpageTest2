import React from 'react'; 
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';

class TicketListTable extends React.Component{
    render(){
        return(
            <TableRow>
                <TableCell><input type="checkbox"/></TableCell>
                <TableCell>{this.props.ticketing_id}</TableCell>
                <TableCell><img src={this.props.user_id} alt="profile"/></TableCell>
                <TableCell>{this.props.show_id}</TableCell>
                <TableCell>{this.props.show_date_id}</TableCell>
                <TableCell>현장 선착순</TableCell>
                <TableCell>{this.props.ticketing_date}</TableCell>
            </TableRow>
        )
    }
}
export default TicketListTable; 