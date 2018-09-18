import React, { Component } from 'react'

class Projects extends Component {
  render() {
    const {
      data: {
        data: { projects: projects }
      }
    } = this.props

    return (
      <div>
        {projects.map(p => (
          <Project {...p} />
        ))}
      </div>
    )
  }
}

export default Projects

const Project = ({ title, slides }) => {
  return (
    <div>
      <h2>{title}</h2>
      <ul>
        {slides.map(s => (
          <Slide {...s} />
        ))}
      </ul>
    </div>
  )
}

const Slide = ({ image }) => <img src={image.url} width={400} />
