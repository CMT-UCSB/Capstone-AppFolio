import React from 'react'
import { FAQBackground, TextContainer } from './FAQElements'


const FAQ = () => {
    return (
        <FAQBackground id={'faq'}>
            <TextContainer>
                <h1 style={{color: 'white'}}>FAQ</h1>
                <h3 style={{color: 'white'}}>Q1. What is Synergi?</h3>
                <p style={{color: 'white', fontSize: '17px'}}>
                    Synergi is a platform where managers can send out surveys/quiz to employees, 
                    and collect meaningful insight into their teams&apos; synergy and performance.
                </p>
            </TextContainer>
        </FAQBackground>
    )
}

export default FAQ