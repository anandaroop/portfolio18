import React from 'react'
import PropTypes from 'prop-types'

class HelloWorld extends React.Component {
  componentDidMount() {
    setTimeout(() => {
      console.log('5 seconds')
    }, 5000)
  }

  render() {
    return <React.Fragment>Greeting: {this.props.greeting}</React.Fragment>
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
}

export default HelloWorld
