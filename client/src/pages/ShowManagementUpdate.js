import React, {Component} from 'react';
import ShowUpdate from 'components/ShowUpdate'








class ShowManagementUpdate extends Component {
    
    constructor(props) {
        super(props);
        this.state = {
            showManagementUpdate: '',
            completed: 0,
            
        }
        this.stateRefresh = this.stateRefresh.bind(this);
    }

    stateRefresh = () => {
        this.setState({
            showManagementUpdate: '',
            completed: 0,
        
       });
        this.callApi()
        .then(res => this.setState({showManagementUpdate: res}))
        .catch(err => console.log(err));
    }

    componentDidMount() {
        //this.timer = setInterval(this.progress, 20);
        this.callApi()
        .then(res => this.setState({showManagementUpdate: res}))
        .catch(err => console.log(err));
        
    }

    callApi = async () => {
        const response = await fetch('/api/showManagementUpdate');
        const body = await response.json();
    
        return body;
    }

    

    handleValueChange = (e) => {
        let nextState = {};
        nextState[e.target.name] = e.target.value;
        this.setState(nextState);
    }

    render() {
        return(
            <div>
                <ShowUpdate/>


                
                
            </div>

                    
                
        );


    };
}
             export default ShowManagementUpdate;