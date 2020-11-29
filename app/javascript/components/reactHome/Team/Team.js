import React from 'react'
import { TeamBackground, TextContainer } from './TeamElements'


const Team = () => {
    return (
        <TeamBackground id={'team'}>
            <TextContainer>
                <h1 style={{color: 'white'}}>Our Team</h1>
                <ul style={{color: 'white'}}>
                    <li><h5 style={{color: 'white'}}>Cambria Tolsma <i style={{color: 'white', fontSize: '16px'}}>(Team Lead)</i></h5> </li>
                    <li><h5 style={{color: 'white'}}>Rucha Kolhatkar <i style={{color: 'white', fontSize: '16px'}}>(Team Scribe)</i></h5></li>
                    <li><h5 style={{color: 'white'}}>Rain Wang</h5></li>
                    <li><h5 style={{color: 'white'}}>Kyle Gusdorf</h5></li>
                    <li><h5 style={{color: 'white'}}>Hill Xiong</h5></li>
                </ul>
            </TextContainer>
        </TeamBackground>
    )
}

export default Team