import React from 'react'
import { HomeBackground, HomeContainer, Logo, Text, BtnContainer, Btn } from './MainElements'

const Main = () => {
    return (
        <HomeBackground id={'home'}>
            <HomeContainer>
                <Logo>Synergi</Logo>
                <Text>Tracker for Manager</Text>
            </HomeContainer>
            <BtnContainer>
                <Btn><a href='/managers/sign_in' style={{color: "black"}}>Sign In</a></Btn>
                <Btn><a href='/managers/sign_up' style={{color: "black"}}>Sign Up</a></Btn>
            </BtnContainer>
        </HomeBackground>
    )
}

export default Main