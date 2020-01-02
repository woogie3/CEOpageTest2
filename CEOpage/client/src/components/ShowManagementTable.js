import React from 'react';
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import { withRouter } from "react-router-dom";
import Button from '@material-ui/core/Button';
import ShowDelete from './ShowDelete';

class ShowManagementTable extends React.Component {
    render() {
        return (
            <TableRow>
                <TableCell><show_thumbnail src = {this.props.show_thumbnail}/></TableCell>
                <TableCell>{this.props.show_preview}</TableCell>
                <TableCell>{this.props.show_title}</TableCell>
                <TableCell>{this.props.start_date}</TableCell>
                <TableCell>{this.props.end_date}</TableCell>
                <TableCell>{this.props.show_time}</TableCell>
                <TableCell>{this.props.show_length}</TableCell>
                <TableCell>{this.props.genre_name}</TableCell>
                <TableCell>{this.props.genre_content}</TableCell>
                <TableCell>{this.props.show_content}</TableCell>
                <TableCell>{this.props.audience1_price}</TableCell>
                <TableCell>{this.props.audience2_price}</TableCell>
                <TableCell>{this.props.audience3_price}</TableCell>
                <TableCell>{this.props.audience4_price}</TableCell>
                <TableCell>{this.props.audience5_price}</TableCell>
                <TableCell>{this.props.audience6_price}</TableCell>
                <TableCell><Button variant="contained" color="primary" onClick={this.page}>수정</Button></TableCell>
                <TableCell><ShowDelete stateRefresh={this.props.stateRefresh} show_title={this.props.show_title}/></TableCell>
                
                
                
            </TableRow>
        )
    }
}
export default withRouter(ShowManagementTable);