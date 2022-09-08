# Source ecl completions
# TODO: Write fish shell completions for ECL.
#source /usr/local/var/ecl.auto

# Add brew openvpn to the path
set -x PATH "/Users/tobio/Library/Application Support/Coursier/bin" $PATH "/usr/local/sbin/"

alias tsh-govcloud="tsh login --proxy=teleport-proxy.us-gov-east-1.security.aws.elastic-cloud.com --auth=okta"
alias tsh-prod="tsh login --proxy=teleport-proxy.secops.elstc.co --auth=okta"
alias tsh-stage="tsh login --proxy=teleport-proxy.staging.getin.cloud --auth=okta"
function tssh ()
    tsh ssh ubuntu@$argv[1]
end


alias okta-govcloud="okta-awscli --okta-profile govcloud-default --profile govcloud-default"
alias okta-govcloud-public="okta-awscli --okta-profile govcloud-default-public --profile govcloud-default-public"

function posix-source
    for i in (cat $argv)
        if test (echo $i | sed -E 's/^[[:space:]]*(.).+$/\\1/g') != "#"
            set arr (echo $i |tr = \n)
            if test $arr[1] != ""
                set -gx $arr[1] $arr[2]
            end
        end
    end
end

function update-cloud-local -a prefix;
    if test -n "$prefix"
        set domain "cloud-$prefix"
    else
        set domain "cloud"
    end

    ecl --config ce-gcp --host http://$domain.modestmind.net:12300 api -X PUT '/v1/platform/configuration/api_base_url?skip_cascading_operations=true' -d "{\"value\":\"https://$domain.modestmind.net:12443\"}" -H "Content-Type: application/json"
    ecl --config ce-gcp --host http://$domain.modestmind.net:12300 api -X PUT '/v1/platform/configuration/networking/deployment_domain_name' -d "{\"value\":\"$domain.modestmind.net\"}" -H "Content-Type: application/json"

    # make show-service-account > ~/.config/gcs-sa.json
    # set sa_conf (cat ~/.config/gcs-sa.json | jq -c .)
    # sed -i /Users/tobio/Projects/cloud/.envrc "s/export API_TESTS_GCS_SA_CONF='$sa_conf'"
    # direnv allow /Users/tobio/Projects/cloud/
end

function patch-bloop-for-debug;
    set buildinfo_config .bloop/buildinfo.json
    set extra_resource (pwd)/scala-services/buildinfo/build/resources/main/ 
    set patched_info (cat $buildinfo_config | jq --arg extra_resource "$extra_resource" '.project.resources += [$extra_resource]')
    echo $patched_info | jq . > $buildinfo_config
end