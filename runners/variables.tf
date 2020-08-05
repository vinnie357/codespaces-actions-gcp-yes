# gcp
variable project { 
    description = "my projectID"
}
variable region { 
    description = "region to deploy resources in"
}
variable zone { 
    description = "zone to deploy resources in"
}

# github-runners
variable repoName { 
    description = "repository to setup runners for"
}
variable network { 
    description = "network to create runners in"
    default = "default"
}
variable repoOwner { 
    description = "owner of repository"
}
variable githubToken { 
    description = "githubToken runners should use"
}
variable repoURL { 
    description = "repository URL to setup runners for"
}
variable runners {
    description = " number of runners for the repository"
    default = 1
}
