import React from 'react'
import { SidebarContainer, Icon, CloseIcon, SidebarWrapper, SidebarMenu, SidebarLink, SideBtnList, SideBtnWrap } from './SidebarElements'

const Sidebar = ({ isOpen, toggle } ) => {
  return (
    <SidebarContainer isOpen={isOpen} onClick={toggle}>
      <Icon onClick={toggle}>
        <CloseIcon />
      </Icon>
      <SidebarWrapper>
        <SidebarMenu>
          <SidebarLink to='about' onClick={toggle}>About</SidebarLink>
          <SidebarLink to='team' onClick={toggle}>Team</SidebarLink>
          <SidebarLink to='faq' onClick={toggle}>FAQ</SidebarLink>
        </SidebarMenu>
        <SideBtnList>
          {/* change a href to SideBtnLink once signin/signup.js is created */}
          <SideBtnWrap>
            <a href='/managers/sign_in' onClick={toggle}>Sign In</a>
          </SideBtnWrap>
          <SideBtnWrap>
            <a href='/managers/sign_up' onClick={toggle}>Sign Up</a>
          </SideBtnWrap>
        </SideBtnList>
      </SidebarWrapper>
    </SidebarContainer>
  )
}

export default Sidebar