import React, { useState } from 'react'
import PropTypes from 'prop-types'
import { Card, CardBody, CardTitle, CardText, CardLink, Button } from 'reactstrap'
import Container from './Container'

import axios from 'axios'
import setAxiosHeaders from '../AxiosHeaders'
class Note extends React.Component {
    constructor(props) {
        super(props)
        this.handleDestroy = this.handleDestroy.bind(this);
        this.path = `/api/v1/notes/${this.props.note.id}`;
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
        location.reload();
    }

    render() {
        const { note } = this.props
        return (
            <>
                <div style={{padding: '10px 30px'}}>
                    <Card style={{width: '20rem', minHeight: '12rem'}}>
                        <CardBody>
                            <CardTitle>{note.date}</CardTitle>
                            <CardText style={{color: 'black'}}>{note.content}</CardText>
                            <div style={{position: 'absolute', bottom: '8px'}}>
                                <Button onClick={this.handleDestroy} className="btn btn-danger btn-sm">Delete</Button>
                                <Container triggerText='View/Edit' updateNote={this.props.updateNote} note={note} create={false}/>
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