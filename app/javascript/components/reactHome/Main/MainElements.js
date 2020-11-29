import styled from 'styled-components'

export const HomeBackground = styled.div `
    background: black;
    display: flex;
    justify-content: center;
    padding: 0 30px;
    height: 980px;
    position: relative;
`

export const HomeContainer = styled.div `
    position: absolute;
    margin-top: 300px;
    display: flex;
    flex-direction: column;
    align-items: center;
`

export const Logo = styled.h1 `
    color: white;
    font-size: 48px;
    text-align:center;

    @media screen and (max-width: 768px) {
        font-size: 40px;
    }

    @media screen and (max-width: 480px) {
        font-size: 32px;
    }
`

export const Text = styled.p `
    text-align: center;
    max-width: 600px;
    color: white;
    font-size: 24px;

    @media screen and (max-width: 768px) {
        font-size: 24px;
    }
    @media screen and (max-width: 768px) {
        font-size: 18px;
    }
`

export const BtnContainer = styled.div `
    padding: 8px 24px;
    display: flex;
    flex-direction: row;
    align-items: center;
`

export const Btn = styled.button `
    padding: 8px 24px;
    color: black;
    border-radius: 50px;
    background: white;
    white-space: nowrap;
`