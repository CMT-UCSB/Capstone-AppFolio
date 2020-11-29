import styled from 'styled-components'
import { Link as LinkR } from 'react-router-dom'
import { Link as LinkS } from 'react-scroll'
import { FaTimes } from 'react-icons/fa'

export const SidebarContainer = styled.aside `
    position: fixed;
    z-index: 999;
    width: 100%;
    height: 100%;
    background: #1e1e2f;
    display: grid;
    align-items: center;
    top: 0;
    left: 0;
    transition: 0.3s ease-in-out;
    opacity: ${({ isOpen }) => ( isOpen ? '100%' : '0%') };
    top: ${({ isOpen }) => ( isOpen ? '0' : '-100%' )};
`;

export const CloseIcon = styled(FaTimes) `
    color: white;
`

export const Icon = styled.div `
    position: absolute;
    top: 1.2rem;
    right: 1.5rem;
    background: transparent;
    font-size: 2rem;
    cursor: pointer;
    outline: none;
`;

export const SidebarWrapper = styled.div `
    color: white;
`

export const SidebarMenu = styled.ul `
    display: grid;
    grid-template-colums: 1fr;
    grid-template-rows: repeat(6, 80px);
    text-align: center;

    @media screen and (max-wdith: 480px) {
        grid-template-rows: repeat(6, 60px);
    }
`

export const SidebarLink = styled(LinkS) `
    displayer: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.5rem;
    text-decoration: none;
    list-style: none;
    transition: 0.2s ease-in-out;
    text-decoration: none;
    color: white;
    cursor: pointer;

    &:hover {
        color: var(--light);
        trainsition: 0.2s ease-in-out;
    }
`


export const SideBtnList = styled.li `
    display: flex;
    align-items: center;
    list-style: none;
    display:  list-item;
    justify-content: center;
    grid-template-rows: repeat(6, 80px);
`

export const SideBtnWrap = styled.ul `
    display: flex;
    justify-content: center;

    {/* codes from here is for SideBtnLink 
      * remove once signin/signup.js is created 
      */}
    width: 100px;
    border-radius: 50px;
    background: white;
    white-space: nowrap;
    color: black;
    padding: 10px 22px;
    font-size: 16px;
    outline: none;
    border: none;
    cursor: pointer;
    transition: all 0.2s ease-in-out;
    text-decoration: none;

    &:hover {
        transition: all 0.2s ease-in-out;
        background: var(--light);
    }
      
`

export const SideBtnLink = styled(LinkR) `
    border-raidus: 50px;
      background: white;
      white-space: nowrap;
      padding: 16px 64px;
      color: black;
      font-size: 16px;
      outline: none;
      border: none;
      cursor: pointer;
      transition: all 0.2s ease-in-out;
      text-decoration: none;

      &:hover {
          transition: all 0.2s ease-in-out;
          background: var(--light);
          color: black;
      }
`