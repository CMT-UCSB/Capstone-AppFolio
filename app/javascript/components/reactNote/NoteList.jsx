import React from 'react'

class NoteList extends React.Component {
    constructor(props) {
        super(props)
    }
    render() {
        return (
            <>
                <div style={{display: 'flex', flexDirection: 'row', flexWrap: 'wrap'}}>
                    {this.props.children}
                </div>
            </>
        )
    }
}
export default NoteList