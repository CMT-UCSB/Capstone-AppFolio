import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import DatePicker from 'react-date-picker'
import { FormGroup, Label, Input, Card, CardBody } from 'reactstrap'

import axios from 'axios'
import setAxiosHeaders from '../AxiosHeaders'
class NoteForm extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            date: new Date(),
            content: ""
        };
        this.onChange = this.onChange.bind(this);
        this.onSubmit = this.onSubmit.bind(this);
    }

    onChange(event) {
        this.setState({ [event.target.name]: event.target.value });
    }

    onSubmit(event) {
        event.preventDefault();
        setAxiosHeaders();
        axios
            .post('/api/v1/notes', {
                note: {
                    date: this.state.date,
                    content: this.state.content,
                },
            })
            .then(respone => {
                console.log(respone);
                console.log(response.data);
            })
            .catch(error => {
                console.log(error)
            })
        event.target.reset()
    }
    render() {
        return (
            <Card>
                <CardBody>
                    <form onSubmit={this.onSubmit}>
                        <div>
                            <FormGroup>
                                <label>Date: </label>
                                <DatePicker
                                    name="date"
                                    ref={this.dateRef}
                                    required={true}
                                    value={this.state.date}
                                    onChange={value => this.setState({ date: value })}
                                    style={{color: 'white'}}
                                />
                            </FormGroup>
                            <FormGroup>
                                <label>Content:</label> <br />
                                <textarea
                                    type="multiline"
                                    name="content"
                                    onChange={this.onChange}
                                    required
                                    className="form-control"
                                    style={{ maxWidth: '450px', minHeight: '200px' }}
                                />
                            </FormGroup>
                        </div>
                        <div>
                            <button type="submit">
                                Add Note
                            </button>
                        </div>
                    </form>
                </CardBody>
            </Card>
        )
    }
}
export default NoteForm

document.addEventListener('turbolinks:load', () => {
    const app = document.getElementById('note_form')
    app && ReactDOM.render(<NoteForm />, app)
})