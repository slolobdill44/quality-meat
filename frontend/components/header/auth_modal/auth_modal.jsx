import React from 'react';
import { Link, withRouter } from 'react-router';

class AuthModal extends React.Component {
  constructor(props) {
      super(props);

      this.state = {
          username: "",
          password: ""
      };
      this.handleSubmit = this.handleSubmit.bind(this);
  }

  	componentDidUpdate() {
  		this.redirectIfLoggedIn();
  	}

  	redirectIfLoggedIn() {
  		if (this.props.loggedIn) {
  			this.props.router.push("/");
  		}
  	}

  	update(field) {
  		return e => this.setState({
  			[field]: e.currentTarget.value
  		});
  	}

  	handleSubmit(e) {
  		e.preventDefault();
  		const user = this.state;
  		this.props.processForm({user});
  	}

  	navLink() {
  		if (this.props.formType === "login") {
  			return <Link to="/signup">sign up instead</Link>;
  		} else {
  			return <Link to="/login">log in instead</Link>;
  		}
  	}

  	renderErrors() {
  		return(
  			<ul>
  				{this.props.errors.map((error, i) => (
  					<li key={`error-${i}`}>
  						{error}
  					</li>
  				))}
  			</ul>
  		);
  	}

  render() {
    return (
      <div className="login-form-container">

        <h2 className="login-form-header">{this.props.formType}</h2>

				<form onSubmit={this.handleSubmit} className="login-form-box">
					<br/>

					{this.renderErrors()}
					<div className="login-form">
						<br/>
						<label> Username:
							<input type="text"
								value={this.state.username}
								onChange={this.update("username")}
								className="login-input" />
						</label>
            <br/>
						<label> Password:
							<input type="text"
								value={this.state.password}
								onChange={this.update("password")}
								className="login-input" />
						</label>
						<br/>
						<input className="login-button" type="submit" value="Submit" />
					</div>
				</form>

        Already have an account? {this.navLink()}
			</div>
    );
  }
}

export default AuthModal;
