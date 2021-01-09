import React from 'react'
import PropTypes from 'prop-types'
import { Card, CardBody, CardTitle, CardText, CardLink, Button } from 'reactstrap'

import axios from 'axios'
import setAxiosHeaders from '../AxiosHeaders'
class Note extends React.Component {
    constructor(props) {
        super(props)
        this.handleDestroy = this.handleDestroy.bind(this);
        this.path = `/api/v1/notes/${this.props.note.id}`;
    }
    updateNote = () => {
        this.props.updateNote();
    }
    handleDestroy() {
        setAxiosHeaders();
        const confirmation = confirm("Are you sure?");
        if (confirmation) {
            axios
                .delete(this.path)
                .then(response => {
                    console.log(response);
                    console.log(response.data);
                })
                .catch(error => {
                    console.log(error);
                });
        }
    }

    render() {
        const { note } = this.props
        return (
            <>
                <div style={{padding: '5px'}}>
                    <Card style={{width: '20rem', minHeight: '12rem'}}>
                        <CardBody>
                            <CardTitle>{note.date}</CardTitle>
                            <CardText>{note.content}</CardText>
                            <div style={{position: 'absolute', bottom: '8px'}}>
                                <Button onClick={this.handleDestroy} style={{color: 'red'}}>Delete</Button>
                                <Button style={{color: 'white'}}>View/Edit</Button>
                            </div>
                        </CardBody>
                    </Card>
                </div>
            </>
        )
    }
}
export default Note
Note.propTypes = {
    note: PropTypes.object.isRequired,
}