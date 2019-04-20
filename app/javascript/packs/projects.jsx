import React from 'react'
import ReactDOM from 'react-dom'

const root = document.querySelector('#root')
const props = JSON.parse(root.dataset.props)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Projects {...props} />, root)
})

const Projects = ({ data }) => {
  return (
    <div>
      <h1>Projects</h1>
      {data.projects.edges.map(({ node: { slug, ...props } }) => (
        <Project key={slug} {...props} />
      ))}
      <hr />
    </div>
  )
}

const Project = ({ title, slides }) => {
  return (
    <div>
      <h2>{title}</h2>
      {slides.edges.map(({ node: { id, image } }) => (
        <img
          key={id}
          src={image.smallUrl}
          style={{ maxWidth: '170px', maxHeight: '170px', marginRight: '1em' }}
        />
      ))}
    </div>
  )
}
