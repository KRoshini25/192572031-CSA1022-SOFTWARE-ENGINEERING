def signup(username, password):
    if not username or not username.strip():
        return "Username is required"
    if len(password) < 6:
        return "Password must be at least 6 characters"
    return "Signup successful"


if __name__ == "__main__":
    print(signup("roshini", "python123"))
    print(signup("", "python123"))
    print(signup("roshini", "abc"))
