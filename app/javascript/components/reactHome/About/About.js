import React from 'react'
import { AboutBackground, TextContainer } from './AboutElements'


const About = () => {
    return (
        <AboutBackground id={'about'}>
            <TextContainer>
                <h1 style={{color: 'white'}}>Our Mission</h1>
                <p style={{color: 'white', fontSize: '17px'}}> 
                    We are creating an application that will allow managers to have simple and meaningful insight into their teams’ synergy and performance. 
                    Employees will be able to provide both identified and anonymized feedback about how well they’re working with their fellow team members. 
                    As a manager, you will be able to send your teams reminders at regular intervals so you can monitor their trends over time. 
                    You can observe these trends and use them to make decisions regarding the division of labor or redistribute members if needed.
                </p>
            </TextContainer>
        </AboutBackground>
    )
}

export default About