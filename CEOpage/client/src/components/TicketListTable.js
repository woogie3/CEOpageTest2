import React from 'react'; 
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';

class TicketListTable extends React.Component{
    render(){
        return(
            <TableRow>
                <TableCell>{this.props.name}</TableCell>
                <TableCell>{this.props.user_id}</TableCell>
                <TableCell>{this.props.show_title}</TableCell>
                <TableCell>{this.props.show_time}</TableCell>
                <TableCell>{this.props.key}</TableCell>
                <TableCell>{this.props.ticketing_date}</TableCell>
            </TableRow>
        )
    }
}
export default TicketListTable; 