import React from 'react'
import ReactDOM from 'react-dom'
import Web3 from 'web3'
import './../css/index.css'
class App extends React.Component {
   constructor(props){
      super(props)
      this.state = {

      }
   }
voteNumber(number){
      console.log(number)
   }
render(){
      return (
         <div className="main-container">
            <h1>Get your ticket now!
            <ul>
               <li onClick={() => {this.purchaseTicket()}}>1</li>
            </ul>
         </div>
      )
   }
}
ReactDOM.render(
   <App />,
   document.querySelector('#root')
)
