import React from 'react'
import ReactDOM from 'react-dom'

import axios from 'axios'

import NoteList from "./NoteList"
import Note from "./Note"
import Container from "./Container"

class ReactNote extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            notes: []
        };
        this.getNotes = this.getNotes.bind(this);
    };
    componentDidMount() {
        this.getNotes()
    };
    getNotes() {
        axios
            .get("/api/v1/notes")
            .then(response => {
                const notes = response.data;
                this.setState({ notes });
            })
            .catch(error => {
                console.log(error);
            })
    };

    render() {
        return (
            <>
                <div style={{display: 'flex', justifyContent: 'space-between'}}>
                    <h1>Note</h1>
                    <Container triggerText='New'/>
                </div>
                <NoteList>
                    {this.state.notes.map(note => (
                        <Note key={note.id} note={note} updateNote={this.getNotes} />
                    ))}
                </NoteList>
            </>
        )
    }
}
export default ReactNote

document.addEventListener('turbolinks:load', () => {
    const app = document.getElementById('react_note')
    app && ReactDOM.render(<ReactNote />, app)
})